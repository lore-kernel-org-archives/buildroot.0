From: =?UTF-8?Q?Guillaume_GARDET_-_Olis=c3=a9o?= <guillaume.gardet@oliseo.fr>
Date: Fri, 3 Feb 2017 14:46:16 +0100
Subject: [Buildroot] Firmware auto-loading does not work
In-Reply-To: <CAOMZO5B2N2bONBTYGj0v3pWCZzsE4PtYtrWOkbmf4ML_Zq7V+g@mail.gmail.com>
References: <5a5c69bf-efc5-e35c-f95c-d303047320c4@oliseo.fr>
 <874m0ngv5h.fsf@dell.be.48ers.dk>
 <7ee11e7f-a489-9f3a-cfd8-3d93f291f695@oliseo.fr>
 <87ziiffdqw.fsf@dell.be.48ers.dk>
 <718ddc67-8e29-1c1b-3a73-74ada73662ab@oliseo.fr>
 <871svk8t56.fsf@dell.be.48ers.dk>
 <47a61250-05eb-b3e6-54f6-3bb27e897f0e@oliseo.fr>
 <CAOMZO5B2N2bONBTYGj0v3pWCZzsE4PtYtrWOkbmf4ML_Zq7V+g@mail.gmail.com>
Message-ID: <72f84eb4-c12e-e23e-b0dc-3799a07c4f03@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Le 03/02/2017 ? 14:30, Fabio Estevam a ?crit :
> On Fri, Feb 3, 2017 at 7:51 AM, Guillaume GARDET - Olis?o
> <guillaume.gardet@oliseo.fr> wrote:
>
>> The thing is that the PATH is not good :
>> * requested :
>> /sys/devices/platform/musb-omap2430/musb-hdrc.0/usb2/2-1/2-1:1.0/firmware/2-1:1.0
>> * real:
>> /sys/devices/platform/musb-omap2430.0/musb-hdrc.0/usb2/2-1/2-1:1.0/firmware/2-1:1.0
>>
>> The only difference is the ".0" missing after musb-omap2430. Any idea why
>> there is this difference?
> This depends on how you registered the musb-omap2430 platform device.
> If you pass '-1' as the id then it will not register with the .0 in
> the name.
>
> Check how we do this on arch/arm/mach-imx/devices/platform-pata_imx.c,
> for example.
>
> imx_add_platform_device("pata_imx", -1, res, ARRAY_SIZE(res), NULL, 0);
>
> The '-1' is the key thing here.
>

I am using an old kernel (2.6.37), but there is a similar function:
     dev_set_name(dev, "musb-omap2430");

I will try to append the ".0" here and see if it is ok.


Guillaume
