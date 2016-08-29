From: Kinsella, Ray <ray.kinsella@intel.com>
Date: Mon, 29 Aug 2016 14:14:53 +0100
Subject: [Buildroot] [PATCH] [RFC] platform: update galileo to 3.14
	kernel
In-Reply-To: <1472474898.4887.366.camel@linux.intel.com>
References: <1471868735-13766-1-git-send-email-padraig.connolly@intel.com>
 <20160822163337.484cb311@free-electrons.com>
 <E704BB48EC9FDF4FA0A7A278C2546ACFE25B11@irsmsx105.ger.corp.intel.com>
 <20160823112531.13f75bab@free-electrons.com>
 <E704BB48EC9FDF4FA0A7A278C2546ACFE27080@irsmsx105.ger.corp.intel.com>
 <1472474898.4887.366.camel@linux.intel.com>
Message-ID: <bfd7fef5-f76a-723e-433c-955f28a991d8@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Andy,

>
> What is the "Galileo platform driver"?

It is an out-of-tree driver for the Galileo platform.

> I'm pretty sure everything listed
> above is working in upstream and you are actually talking about
> _external_ (to Quark SoC) pinctrl driver which is indeed absent as any
> means of pinmuxing run-time in upstream.

The Galileo platform driver reserves some of the pin's for muxing, loads 
the GPIO expander, I2C and SPI drivers. As you point out later in your 
email much the same as can be achieved with ACPI override.

>
> I have no idea if it goes to category "reasonable support", though mention issue is applied to all similar boards (UP, Edison/Arduino, ...).

I am afraid I don't understand.

>
> Comments below are not exactly related to Buildroot.
>
>>  USB device support is also less reliable without the fix.
>
> Is the fix going to be upstreamed?

No - from memory there was really no acceptable way to fix this issue 
upstream - it was pretty nasty.

>>
>> Once the platform was in the wild with the DSDT broken table, the
>> only
>> way to be sure that any given platform would work correctly was to
>> use
>> the platform driver.
>
> Nope. There are two mechanisms now to override and upgrade the ACPI
> table(s). Somewhere (Ostro?) I saw a direction to a right way.
>

Yup - I am familiar with this, I know the guys who did the work. Using 
the ACPI override is another way to go - I haven't validated that Kernel 
and I don't know if it includes the USB fixes ( and others ).

We have however gone to the effort of validating the Kernel referred to 
in Padraig's patch.

Thanks,

Ray K
