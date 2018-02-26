From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Feb 2018 20:01:38 +0100
Subject: [Buildroot] Analysis of build results for 2018-02-25
In-Reply-To: <20180226154724.4e87f072@windsurf.lan> (Thomas Petazzoni's
 message of "Mon, 26 Feb 2018 15:47:24 +0100")
References: <20180226070010.28C8620727@mail.bootlin.com>
 <20180226113319.7e3bcf6b@windsurf.lan>
 <87fu5nsyrg.fsf@dell.be.48ers.dk>
 <20180226140029.45325514@windsurf.lan>
 <87bmgbsv4z.fsf@dell.be.48ers.dk>
 <20180226154724.4e87f072@windsurf.lan>
Message-ID: <877eqzshgt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Mon, 26 Feb 2018 15:06:20 +0100, Peter Korsgaard wrote:

 >> > mplayer upstream is dead ? If that is the case, then indeed we should
 >> > just take those patches as-is.  
 >> 
 >> I haven't followed development in details, but the latest mplayer
 >> release is more than 2 years old and several forks exists (E.G. mpv).

 > But isn't mplayer one of those projects that says that releases are
 > useless, and people should always use the latest trunk/master/tip
 > because it's obviously "the best".

Maybe. I do see some recent changes in subversion, but mainly small
things (tweaks to the handwritten configure script).

 >> >> Or deprecate qt4?  
 >> 
 >> > Just because it's broken on powerpc?  
 >> 
 >> Well, mainly because it is no longer maintained upstream. Even Debian is
 >> removing Qt4:
 >> 
 >> https://wiki.debian.org/Qt4Removal

 > True, but we are not going to remove it for 2018.02, right ?

It is indeed getting quite late for 2018.02, but given that:

- It isn't supported upstream
- The package is orphaned in Buildroot
- Other distributions (like Debian) no longer supports it

Makes me think that we won't be able to do a good job supporting it
throughout the 2018.02 support cycle.

We don't have a good way of handling deprecations, so I'm not sure what
the best option is:

- Do nothing
- Change prompt to "Qt (obsolete)"
- Remove package

-- 
Bye, Peter Korsgaard
