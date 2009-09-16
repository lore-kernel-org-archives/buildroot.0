From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Sep 2009 00:08:46 +0200
Subject: [Buildroot] [PATCH 2/6] Remove the BOARD/LOCAL feature
In-Reply-To: <d6cda7730909161500xbb81de5j195ce89fd2fd5db2@mail.gmail.com>
References: <1253135266-26880-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1253135266-26880-3-git-send-email-thomas.petazzoni@free-electrons.com>
	<d6cda7730909161500xbb81de5j195ce89fd2fd5db2@mail.gmail.com>
Message-ID: <20090917000846.2eb5baca@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 16 Sep 2009 19:00:26 -0300,
Thiago A. Corr?a <thiago.correa@gmail.com> a ?crit :

> That would be nice. I tried to figure a way to do that, but since
> Kconfig doesn't support things like source *.in I couldn't figure a
> way.

I've already prototyped something for that. I don't really like the
solution, but as you said, the Kconfig syntax is pretty limited, so I
haven't found any other solution than:

http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=external-boards&id=ed47f42a598c665bf42c4e797187f233b955e285

This works for me. You just do:

export BUILDROOT_EXTERNAL_BOARDS=/some/directory
make menuconfig
 # you see your external boards directly in the configuration
make

And that's it.

What do you think ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
