From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 05 May 2012 08:49:30 +0200
Subject: [Buildroot] [PATCH 1/1] linux: improve the 'make linux-*'
	special commands
In-Reply-To: <a96a992b96d72989cddf72ce8420d6acf28302c3.1336146047.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 4 May 2012 17:40:53 +0200")
References: <cover.1336146047.git.thomas.petazzoni@free-electrons.com>
 <cover.1336146047.git.thomas.petazzoni@free-electrons.com>
 <a96a992b96d72989cddf72ce8420d6acf28302c3.1336146047.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87bom3yvet.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This patch improves two things:
 Thomas>  * It makes sure that the linux-menuconfig and al. commands can be
 Thomas>    executed even if the user hasn't executed 'make' before. Until now,
 Thomas>    the commands were depending on the .configured stamp, which is not
 Thomas>    sufficient since the linux package has been converted to the
 Thomas>    GENTARGETS infrastructure. Instead, depend on the linux-configure
 Thomas>    phony target.

 Thomas>  * It makes sure that those commands are not available when the Linux
 Thomas>    package is not selected, just like we do for Barebox.

Committed, thanks.

-- 
Bye, Peter Korsgaard
