From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Tue, 15 Sep 2015 14:48:45 +0100
Subject: [Buildroot] [PATCH] Enable vlc to run as root
In-Reply-To: <55F81E45.1020305@imgtec.com>
References: <712f10f4f1eb6452279b88cb749906e66f711d8a.1442322597.git.jpinto@synopsys.com>
 <55F81E45.1020305@imgtec.com>
Message-ID: <55F821BD.4010006@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicent,

On 9/15/2015 2:33 PM, Vicente Olivert Riera wrote:
> Dear Joao Pinto,
> 
> Regards,
> 
> Vincent.
> 
> On 09/15/2015 02:20 PM, jpinto wrote:
>> A great number of embedded system only include the root user.
> 
> systems
> 
>> This patch has the goal of enabling vlc to be ran as root.
>>
>> Signed-off-by: jpinto <jpinto@synopsys.com>
>> Tested-by: jpinto <jpinto@synopsys.com>
> 
> Use your full name here.

Ok, in future patches I will do it.

> 
>> ---
>>  package/vlc/vlc.mk | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
>> index 6f7fd58..4e84b12 100644
>> --- a/package/vlc/vlc.mk
>> +++ b/package/vlc/vlc.mk
>> @@ -54,6 +54,7 @@ VLC_CONF_OPTS += \
>>  	--disable-mfx \
>>  	--disable-vdpau \
>>  	--disable-addonmanagermodules \
>> +	--enable-run-as-root \
> 
> I don't know if running vlc as root is disabled by default due to
> security reasons, but if so, perhaps we could do this selectable by the
> user via menuconfig.

I understand that security might be an issue since VLC is not used only for
reproducing video.

> 
> Also, there is a guy here [1] saying that although he configured it with
> --enable-run-as-root, it still not working:

For me worked fine with this change.

> 
> [1]
> http://www.hackersgarage.com/vlc-is-not-supposed-to-be-run-as-root-sorry-solution.html
> 
> Have you done a runtime test to check that it actually works?

Yes, I made a project using the ARM Juno r1 board and worked perfectly.

> 
> Regards,
> 
> Vincent.
> 
>>  
>>  # Building static and shared doesn't work, so force static off.
>>  ifeq ($(BR2_STATIC_LIBS),)
>>

Thanks,
Joao Pinto
