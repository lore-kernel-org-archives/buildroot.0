From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 May 2012 23:30:05 +0200
Subject: [Buildroot] (newbie question)
In-Reply-To: <CAFC29aUwvGS-tsbLiCe7=7W1HZ0UZ409BMhf5Y73r289FSuNUA@mail.gmail.com>
References: <CAFC29aU6nfLkHpbs1mKhV13aVdtskqtKtCpURpzi-gQErviriQ@mail.gmail.com>
 <20120515224254.6bff263a@skate>
 <CAFC29aUwvGS-tsbLiCe7=7W1HZ0UZ409BMhf5Y73r289FSuNUA@mail.gmail.com>
Message-ID: <4FB2CADD.9040001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/15/12 23:13, Ron Eggler wrote:
> I've been trying to get some diff going with this commmand but somehow I don't get a good result, why's that?
> reg at desktop-reg:/usr/local/src/E10-buildroot/br1202-main/package$ diff -r ./ ../../../E10orig_clone/br1202-main/package/

  See 'diff --help':

   -N, --new-file                  treat absent files as empty

  You also want the -u option to diff, that gives much more readable output.
Also the -p option is very useful: it gives the current 'function' as context.
In this case it doesn't matter, but it's good to know in general.  So:

diff -Nrup . ../../....


  Please remove the wview-5.20.2.tar.gz file first, though.

  BTW, is there anything wrong with the readline library and zlib library already
available in buildroot?


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
