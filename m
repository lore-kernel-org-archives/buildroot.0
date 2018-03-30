From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 13:11:47 +0200
Subject: [Buildroot] bash: /dev/fd/62: No such file or directory
In-Reply-To: <d624af0cde7298851332a2fc009f173562d99d98.camel@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?= Krause"'s message of "Thu, 29 Mar 2018 21:46:27
 +0200")
References: <1521154501.16532.15.camel@embedded.rocks>
 <874llggl14.fsf@dell.be.48ers.dk>
 <d624af0cde7298851332a2fc009f173562d99d98.camel@embedded.rocks>
Message-ID: <877ept7r7w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

Hi,

 >> Keep in mind that we still support a static /dev, so we should also add
 >> them to system/device_table_dev.txt and redirect errors to /dev/null so
 >> you don't get a bunch of warnings about these symlinks when booting with
 >> a static /dev.

 > I am trying to get this working. I managed to add the entries to
 > inittab for busybox and sysvinit

Great!

 > but I am unsure how to add those symlinks to the static
 > /dev. makedevs does not support symbolic links.

Heh, you are right. We can either:

- Add a BASH_ROOTFS_PRE_CMD_HOOKS hook in bash.mk if static /dev is used
  to create these symlinks

- Extend the makedevs code to also support symlinks

- Completely ignore this issue for static /dev

The first option is probably the easiest/nicest.

-- 
Bye, Peter Korsgaard
