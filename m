From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Mar 2014 23:37:12 +0100
Subject: [Buildroot] Different site methods for the main package and
 patches
In-Reply-To: <53331268.4030205@mind.be>
References: <CA+-urNQrPff3iTDGdWwYvbhLPXwCrqZgVA91qQS_RgM66VG1eQ@mail.gmail.com>
 <53331268.4030205@mind.be>
Message-ID: <20140326233712.4347c3c8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 26 Mar 2014 18:46:16 +0100, Arnout Vandecappelle wrote:

>  You're probably right about that. The problem is that the DOWNLOAD macro
> cannot know if it is given a patch or the package itself. So it should
> probably be changed to get _SITE_METHOD as an optional argument.
> 
>  Yann, perhaps you could take that up into your download method rework
> series?

Generally speaking, I'm a bit unhappy about how things work on the
download front:

 *) I don't really understand why we have a separation between _SITE
    and _SOURCE, and why our infra assumes that _PATCH is relative to
    _SITE. Why don't we simply make _SOURCE and _PATCH full URLs
    instead? This way _PATCH can list multiple patches coming from
    different locations, not necessarily the upstream location of the
    package.

 *) Why is the DOWNLOAD macro looking at _SITE_METHOD ? It believe it
    should be a macro that remains independent of the package
    infrastructure, and it should simply take as argument the
    information that it needs, rather than poking directly into
    _SITE_METHOD.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
