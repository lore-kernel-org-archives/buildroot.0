From: Vadym Kochan <vadim4j@gmail.com>
Date: Mon, 4 Mar 2019 19:16:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/efl: Fix build without OpenGL ES
In-Reply-To: <ef9aef3f-4a9e-bf62-ce70-4b119b5319ad@gmail.com>
References: <20190301002311.17071-1-vadim4j@gmail.com>
 <ef9aef3f-4a9e-bf62-ce70-4b119b5319ad@gmail.com>
Message-ID: <20190304171633.GA14732@lwo1-lhp-f71841>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Mon, Mar 04, 2019 at 06:06:57PM +0100, Romain Naour wrote:
> Hi Vadim,
> 
> Le 01/03/2019 ? 01:23, Vadim Kochan a ?crit?:
> > efl does not compile without OpenGL ES because it checks for
> > GL_ES_VERSION_2_0 and declares own GLintptr and GLsizeiptr
> > types if such version is not defined, so fix it by add check also for
> > OpenGL 1.5 where these types are defined.
> > 
> > Fixes:
> > 	http://autobuild.buildroot.net/results/62ca120f1e54e8c3ae445f98b2624b526569f007
> 
> 
> Thanks for the patch!
> 
> Upstream used a slightly different fix for this issue, can you try to backport
> this patch instead?
> 
> https://git.enlightenment.org/core/efl.git/commit/?id=0d2b624f1e24240a1c4e651aa1cfe9a8dd10a573
> 
> Best regards,
> Romain
> 

Sure, I will.

Regards,
Vadim Kochan
