From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Tue, 4 Sep 2012 14:23:40 -0400
Subject: [Buildroot] [PATCH 1/2] PAM support in Busybox if linux-pam is
	built
In-Reply-To: <201209042013.36710.yann.morin.1998@free.fr>
References: <1346729322-17868-1-git-send-email-golubovsky@gmail.com>
 <201209042013.36710.yann.morin.1998@free.fr>
Message-ID: <CADiAo4LDPr9hc6rHH+_kNJmWKo9KhR2FsnqC1kF3vH-gc7h3yQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Tue, Sep 4, 2012 at 2:13 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:

>>         Local logins with null password are allowed
>> +       for users with records in /etc/passwd ("default" and "root").
>
>> +       The default PAM configuration file requires user accounts with
>> +       nonzero length passwords.
>
> These two sentences tend to contradict each other. What about:

No, they do not contradict each other because they are about two
different files (which may be not so clear as it is written - but I
tried to keep the text short).

The first sentence is about /etc/pam.d/login.

The second is about /etc/pam.d/default (which means any program that
calls pam_start with arbitrary program name and no match in PAM
configs uses /etc/pam.d/default).

>
> To be more in line with other options, I'd suggest this be BUSYBOX_SET_PAM
> (we already have a bunch of BUSYBOX_SET_XXX, although there are variations).
> But I have no strong objection to keeping ENABLE.

I see a whole variety of names:

define BUSYBOX_CONFIGURE_CMDS
	$(BUSYBOX_SET_LARGEFILE)
	$(BUSYBOX_SET_IPV6)
	$(BUSYBOX_SET_RPC)
	$(BUSYBOX_PREFER_STATIC)
	$(BUSYBOX_SET_MDEV)
	$(BUSYBOX_NETKITBASE)
	$(BUSYBOX_NETKITTELNET)
	$(BUSYBOX_INTERNAL_SHADOW_PASSWORDS)
	$(BUSYBOX_DISABLE_MMU_APPLETS)
	$(BUSYBOX_SET_INIT)
	$(BUSYBOX_SET_WATCHDOG)

and there is "DISABLE" ;)

I'd keep "ENABLE".

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
