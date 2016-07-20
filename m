From: Lothar Felten <lothar.felten@gmail.com>
Date: Wed, 20 Jul 2016 10:27:34 +0200
Subject: [Buildroot] how to add UART1,2,3 on beaglebone
In-Reply-To: <20160720052040.GA3766@sapphire.tkos.co.il>
References: <e53c5a20-dc1d-3fda-0dfd-9e46c8f98185@gmail.com>
 <20160720052040.GA3766@sapphire.tkos.co.il>
Message-ID: <578F35F6.9020008@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jehun,

On 20.07.2016 07:20, Baruch Siach wrote:
> Hi Jehun Lee,
>
> On Tue, Jul 19, 2016 at 09:07:26PM -0700, Jehun Lee wrote:
>> I made and load successfully on my beaglebone black by following docs on
>> https://buildroot.org/docs.html.
>> But that image has only one ttyO0 for console. I want to add UART1,2,3 of
>> beaglebone black.
>> How can I do that? Any advice?
>
> You need to add getty entries in your target /etc/inittab file. Look for
> 'ttyO0' in /etc/inittab, and add similar entries for ttyO{1,2,3}.
>
> This assumes that you are using either Busybox init (most likely) or sysvinit.
> If you use systemd, add a symlink in /etc/systemd/system/getty.target.wants/
> for each console.
>
> Hope this helps,
> baruch
>

Maybe your device tree also needs an entry to enable the other uarts, 
something like this:

&uart1 {
	pinctrl-names = "default";
	pinctrl-0 = <&uart1_pins_default>;
	status = "okay";
};

(And check the pinmux, here it's the uart1_pins_default entry)

--
Lothar
