From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 16 Apr 2013 07:17:46 -0300
Subject: [Buildroot] [PATCH 1/3] python-setuptools: forkbump and add
 workaround for shebang
In-Reply-To: <516CEF3C.6070505@mind.be>
References: <1365872210-20167-1-git-send-email-gustavo@zacarias.com.ar>
 <516CEF3C.6070505@mind.be>
Message-ID: <516D254A.4010707@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/16/2013 03:27 AM, Arnout Vandecappelle wrote:

>  Mixing tabs with spaces... Also a few other instances in the rest of
> this patch.

That's probably my vim settings doing something evil, i don't have a
special case for python, i'll fix it.

>  I would add a comment here, e.g.
> 
> # "distribute" is a fork of the unmaintained setuptools package. There
> # are plans to re-merge it into setuptools; if this happens, we can
> # switch back to http://pypi.python.org/packages/source/s/setuptools

Fair enough.

>  Please split this long line. Also, maybe it's worth explaining why we
> want --single-version-externally-managed?

That's for the trick to work, when python builds an egg (zip file) in
the build phase not only are we wasting time doing double decompression
later on the target but we are also finishing up the package (kind of a
mini-install phase) into the egg.
That makes the trick fail (probably solvable by doing --execute in the
build itself, didn't try since it's not the way IMHO).
I'll add a note since it's required for other python packages that do
use setuptools/distribution.
V2 when Thomas confirms it solves his issues with lava-test, did it for
me in my tests.
Regards.
