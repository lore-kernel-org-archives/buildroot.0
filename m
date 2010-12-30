From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 30 Dec 2010 23:40:05 +0100
Subject: [Buildroot] [git commit master 1/1] genext2fs.sh: improve
	number of blocks calculation
In-Reply-To: <201012302331.49472.yann.morin.1998@anciens.enib.fr> (Yann
	E. MORIN's message of "Thu, 30 Dec 2010 23:31:48 +0100")
References: <20101230222011.4B7A08EE7F@busybox.osuosl.org>
	<201012302331.49472.yann.morin.1998@anciens.enib.fr>
Message-ID: <8762uahol6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> Peter, All,
 Yann> On Thursday 30 December 2010 23:10:21 Peter Korsgaard wrote:
 >> +    BLOCKS=$(expr 500 + \( $BLOCKS + $INODES / 8 \) \* 11 / 10)

 Yann> POSIX specifies that you can do arithmetics in the shell:

 Yann> So I'd write that as:

 Yann>   BLOCKS=$(( 500 + (BLOCKS+INODES/8) * 11 / 10 ))

True. I kept it with expr as that's what the rest of the file was doing,
and I didn't find it too bad regarding readability.

-- 
Bye, Peter Korsgaard
