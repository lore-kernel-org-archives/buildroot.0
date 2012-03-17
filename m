From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 Mar 2012 09:14:32 +0100
Subject: [Buildroot] [PATCH 2/2] vsftpd: fix SSL dependency
In-Reply-To: <CAGm1_kv4_CfMehyG4Y65A+YGxeVg8w7mcrGaf9jwRybrqEBAfg@mail.gmail.com>
 (Yegor Yefremov's message of "Sat, 17 Mar 2012 08:18:51 +0100")
References: <1331906095-18056-1-git-send-email-yegorslists@googlemail.com>
 <1331906095-18056-2-git-send-email-yegorslists@googlemail.com>
 <87r4wsp7dl.fsf@macbook.be.48ers.dk>
 <CAGm1_kv4_CfMehyG4Y65A+YGxeVg8w7mcrGaf9jwRybrqEBAfg@mail.gmail.com>
Message-ID: <87sjh7od93.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:

Hi,

 >> So it end up with the libcrypto reference without explicitly linking
 >> with it.

 Yegor> This is output from pkg-config:

 Yegor> pkg-config --libs openssl
 Yegor> -lssl -lcrypto

 Yegor> I don't know what is going on exactly, but could it be that
 Yegor> other toolchains bring valid lcrypto with them?  But vsftpd has
 Yegor> it's own library finder script and it also defines both libs.

I agree it cannot hurt to explicitly link with libcrypto as well - But
for my interest, in what config did it break?

-- 
Bye, Peter Korsgaard
