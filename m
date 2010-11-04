From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Thu, 4 Nov 2010 14:49:36 +0100
Subject: [Buildroot] [PATCH 04/12] autotools: introduce
 $(PKG_NAME)_AUTORECONF_ENV/$(PKG_NAME)_AUTORECONF_OPT variables
In-Reply-To: <20101104144444.40cec726@surf>
References: <1288839031-24277-1-git-send-email-llandwerlin@gmail.com>
	<1288839031-24277-5-git-send-email-llandwerlin@gmail.com>
	<20101104144444.40cec726@surf>
Message-ID: <AANLkTim20r16XFv4VK-EKAkvOMmNX8Mqtq5BJ0G6yJ1L@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok... this set of patch is a bunch of crap...
That would teach me to rebase things at 3:30am :)

Thanks again for reviewing.

Regards,

--
Lionel Landwerlin

On Thu, Nov 4, 2010 at 2:44 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Thu, ?4 Nov 2010 03:50:23 +0100
> llandwerlin at gmail.com wrote:
>
>> Rather than defining the AUTORECONF variable containing the path to
>> the autoreconf tool + all its arguments, we split the variable in two.
>> There is now :
>> ? ? ? - AUTORECONF which contains the path to the autoreconf tool,
>> ? ? ? - $(PKG_NAME)_AUTORECONF_OPT which contains the autoreconf arguments,
>>
>> ? ? ? - and we add $(PKG_NAME)_AUTORECONF_ENV which contains the autoreconf
>> ? ? ? ? environment variables.
>>
>> This allow us to define a specific setup to run autoreconf for both
>> target and host as well as per package if needed.
>
> Ok on the principle, but see comment below.
>
>> + ? ? ?<li><code>LIBFOO_AUTORECONF_OPT</code> to specify additional
>> + ? ? ?options passed to the <i>autoreconf</i> program
>> + ? ? ?if <code>LIBFOO_AUTORECONF=YES</code>. By default, empty.</li>
>
> Seems to be a duplication of :
>
>> + ? ? ?<li><code>LIBFOO_AUTORECONF_OPT</code>, to specify options
>> ? ? ? ?passed to the <i>autoreconf</i> program if
>> - ? ? ?<code>LIBFOO_AUTORECONF=YES</code>. By default, empty.</li>
>> + ? ? ?<code>LIBFOO_AUTORECONF=YES</code>. By default, <code>-f -i -I
>> + ? ? ?"$(ACLOCAL_DIR)"</code>.</li>
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
