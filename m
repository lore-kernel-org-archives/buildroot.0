From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Dec 2019 10:09:35 +0100
Subject: [Buildroot] [PATCH] Revert "package/dialog: bump version to
 1.3-20190808"
In-Reply-To: <20191206133802.127863-1-paul@crapouillou.net> (Paul Cercueil's
 message of "Fri, 6 Dec 2019 14:38:02 +0100")
References: <20191206133802.127863-1-paul@crapouillou.net>
Message-ID: <87zhg3i3ow.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paul" == Paul Cercueil <paul@crapouillou.net> writes:

 > The 1.3-20190808 version looks extremely buggy.
 > For instance, if you try to open a dialog using this command:
 > dialog --no-shadow --msgbox "test test test" 10 32

 > - the --no-shadow attribute doesn't seem to work anymore, since the
 >   frame will sill have a shadow,
 > - the text shown within the frame won't be "test test test" as expected,
 >   but "testtesttest".

 > These bugs make the program completely unusable, so revert to the last
 > known good version.

Funky. I gave it a try (using qemu_arm_versatile_defconfig with sourcery
codebench toolchain) and I indeed see the shadow but the text is
rendered correctly:

http://peter.korsgaard.com/dialog.png

And with the revert the shadow is indeed gone:

http://peter.korsgaard.com/dialog-old.png


Interesting enough, dialog on my (Debian, 1.3-20190211-1) laptop behaves
like the new version, so it also unconditionally adds the frame:

http://peter.korsgaard.com/dialog-debian.png

So I am not sure where you got the corrupted testtesttest from? What is
your TERM variable set to?

Anyway, I am OK with reverting, but it would be great if you could also:

- Contact upstream to get it fixed in future releases
- Add a runtime test for it

-- 
Bye, Peter Korsgaard
