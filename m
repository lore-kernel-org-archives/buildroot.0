From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 May 2013 09:10:52 +0200
Subject: [Buildroot] Issue with the autobuilders: removing 1379 builds from
	the history?
Message-ID: <20130528091052.16da9159@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

While trying to reproduce the flex recent issue that triggered in the
autobuilders, I found out that I couldn't reproduce it. After
investigating, I discovered that the Git commit id being reported by my
autobuilder machine was incorrect. This is due to a change I made in
the autobuilder on May, 13th, where I'm now using a separate Git tree
for each build instead of a common one, but the script was still taking
the Git commit id of some other Buildroot tree. So the build was
actually taking place with the latest Buildroot version, but reported
to use Git commit id 9947ee9fbb94af800b8b054262734e0f81f32250.

This means that when you try to reproduce the build, if you take the
Git commit id given by the autobuilder website, then you won't be
testing with the Git commit id with which the build was made, which is
quite annoying. This is what happened to me when trying to reproduce
the flex problem: I have a script that, given a build SHA1, downloads
the configuration and Git commit ID, and restarts the build with the
exact same commit and the exact same configuration. But for those
builds who reported an invalid Git commit ID... it cannot work, and
therefore I wasn't reproducing the flex problem.

Therefore, I am considering removing those completely bogus build
results from the history. We are talking about removing 1379 build
results, i.e all builds done my autobuilder between May, 14th and today.

Even though it is quite annoying to lose so many results, I believe
this is the best action we can take now.

What do you think?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
