From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 18 Feb 2010 09:37:11 +0100
Subject: [Buildroot] Reduce time for a make, possible?
In-Reply-To: <20100215194451.0aee0f65@surf> (Thomas Petazzoni's message of
	"Mon, 15 Feb 2010 19:44:51 +0100")
References: <SNT129-W199BB281476B38B7CFC464B94A0@phx.gbl>
	<20100215194451.0aee0f65@surf>
Message-ID: <87zl370wjs.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> On Mon, 15 Feb 2010 15:29:48 +0100
 Thomas> Tony Mozi <spooflinux@hotmail.fr> wrote:

 >> When we make a change in the buildroot like add or remove an option,
 >> it's necessary to do 'make clean' then a 'make'. Is it possible to
 >> reduce the time of this operation which is very long?

 Thomas> For the moment, it is not possible safely. However, during the
 Thomas> last Buildroot Working Day last week, this was one of the main
 Thomas> topic that we discussed. So it's definitely not a feature that
 Thomas> will be available in the coming weeks, but pretty likely in the
 Thomas> coming months or so.

Yes. For most situations you can safely add new applications without
rebuilding everything (the problem is with libraries as other
libs/programs might want to enable support for that library). Removing
stuff is more difficult, so there you need to rebuild.

Once the external toolchain stuff is more robust and we have better
package removal/addition tracking things will get better.

-- 
Bye, Peter Korsgaard
