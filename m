From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Apr 2019 16:56:19 +0200
Subject: [Buildroot] [PATCH 1/2] package/msmtp: drop unneeded static
 openssl workaround
In-Reply-To: <20190413083218.6355-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 13 Apr 2019 10:32:17 +0200")
References: <20190413083218.6355-1-fontaine.fabrice@gmail.com>
Message-ID: <87tvf0pre4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > msmtp uses pkg-config to find openssl dependencies such as lz or latomic
 > so drop unneeded openssl workaround that was added by
 > https://git.buildroot.net/buildroot/commit/package/msmtp?id=468bbc1538aaea87beaf455a2ad6ea5a255d5f58

 > I don't know why it was added seven years ago as msmtp already used
 > pkg-config at this time:
 > https://github.com/marlam/msmtp-mirror/blob/rel-1-4-27/configure.ac

I believe it was because we didn't used to pass --static to pkg-config
before

commit 958c9438ccb5e8c8864edf242b6b4ce3b1f058a4
Author: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date:   Wed Mar 5 12:19:37 2014 +0000

    host-pkgconf: use --static option for static builds

-- 
Bye, Peter Korsgaard
