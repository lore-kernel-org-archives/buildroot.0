From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Aug 2010 16:45:47 +0200
Subject: [Buildroot] [PATCH] GStreamer: xorg support
In-Reply-To: <4C6FCC33.8040206@marretta.com>
References: <4C6FCC33.8040206@marretta.com>
Message-ID: <20100821164547.54340abc@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Massimiliano,

On Sat, 21 Aug 2010 14:53:07 +0200
Massimiliano Marretta <max@marretta.com> wrote:

>   I add support for xorg and upgrade version for mp3 issue.

Thanks!

However, your patch cannot be applied because it has several issues :

 * It is word-wrapped, probably because of your e-mail client
   (Thunderbird)

 * It does not have the proper Git format (it is not an unified diff,
   it lacks a description, etc.)

Could you prepare a Git patch for this ?

In just a nutshell, here is how you can generate your first Git
patches :

 1. Install git

    Under Debian/Ubuntu: sudo aptitude install git

 2. Clone the Buildroot git repository

    git clone git://git.busybox.net/buildroot

 3. Configure git by writing the following ~/.gitconfig file

===START OF FILE================================
[user]
        name = Massimiliano Marretta
        email = max at marretta.com

[sendemail]
	smtpserver = your-smtp-server.com
===END   OF FILE================================

 4. Create your local branch for your work

    cd buildroot
    git branch gstreamer-xorg-and-mp3

 5. Switch to your branch

    git checkout gstreamer-xorg-and-mp3

 6. Make a change

    vi/emacs yourfile

 7. Commit it

    git commit -a -s

    and enter a meaningful commit log

 8. Go back at step 6 and 7 for all other changes. Each logical change
    should be split in a separated commit.

 9. Send your changes to the mailing list

    git send-email --to buildroot at uclibc.org master

Of course, this a just a quick recipe on how to use Git. You'll find
more details in the dozens of documentation and tutorials available on
the Web.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
