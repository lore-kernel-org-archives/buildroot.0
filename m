From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 14 Feb 2012 10:49:00 +0100
Subject: [Buildroot] [PATCH] Added microblaze patch
In-Reply-To: <CAM+bi4vAuMsH5=YU6_KAuzF6PVdjE4Ay76hqQzaoHp=Wzb0vvg@mail.gmail.com>
 (Alvaro Gamez's message of "Tue, 14 Feb 2012 10:22:05 +0100")
References: <CA+appbNdaSajXPdKk4OTyj0WOmeu=9PKr-Sa=cwAZNr76ujLnA@mail.gmail.com>
 <1329095038-32117-1-git-send-email-Spenser309@gmail.com>
 <201202132237.18495.arnout@mind.be>
 <CA+appbP7552z3cjwoN-1bN0u78xf8bMkCdVFXofDC=YtXz81Xw@mail.gmail.com>
 <CA+appbPADbFMF4qp2fnDw7mhkEcVZ2mUUTFRLKrPycV4PqQB6w@mail.gmail.com>
 <CAM+bi4vAuMsH5=YU6_KAuzF6PVdjE4Ay76hqQzaoHp=Wzb0vvg@mail.gmail.com>
Message-ID: <87ehtxwxrn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alvaro" == Alvaro Gamez <alvaro.gamez@hazent.com> writes:

 Alvaro> The problem is that wget tries to save the file as
 Alvaro> index.html?p=xldk%2Fmicroblaze_v2.0.git;a=blob;f=
 Alvaro> microblaze-unknown-linux-gnu.tgz

 Alvaro> so the expected file microblaze-unknown-linux-gnu.tgz doesn't
 Alvaro> appear. Maybe it is possible to redefine DOWNLOAD_WGET with a
 Alvaro> third parameter that makes wget execute with -O output.tar.gz
 Alvaro> option?

Yes, I think so. I'll look into it. We had somewhat similar problems
with mpfr, where upstream provides a non-unique patch name (patches or
allpatches or something like that), where we would like to rename it to
mpfr-$VERSION-patches after download.

-- 
Bye, Peter Korsgaard
