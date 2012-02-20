From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 20 Feb 2012 21:45:41 +0000 (UTC)
Subject: [Buildroot] Where does post-build script belong?
References: <jhub5r$smv$1@dough.gmane.org>
 <CAC78GpcJ8nZ0QrZ01a0sDgVxV7kN12ShRi27Cv8sGLg4-TKXgQ@mail.gmail.com>
Message-ID: <jhueu4$u5p$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-02-20, J.C. Woltz <jwoltz@gmail.com> wrote:
> On Mon, Feb 20, 2012 at 3:41 PM, Grant Edwards
><grant.b.edwards@gmail.com> wrote:
>>
>> I'm trying to use a post-build script to fix up the init.d/S59snmpd
>> file, but I can't figure out what the post-build script path should
>> be.
>
> The post-build script can be where you want it :) When you define the
> post build script to run, it is relative to the buildroot main
> directory

That's the bit of info I was looking for.  I'd been trying to figure
that out via trial-and-error for a while, but I'd been editing the
defautl config file without ever regenerating the .config file in the
output directory -- so it was all "error" and no "trial".

> Personally, I keep my post-build is a directory structure like:
> board/manufacture/model/post-build.sh

I prefer to modify the buildroot source tree as little as possible (it
makes upgrading to a new version easier).  So I keep everything
outside it that I can.  I've put what used to be my
package/customize/source directory in "../customfiles", my post-build
script in "../postbuild.sh", and my output directory is "../output".

>> It would be awfully nice if the help text for "path" config options
>> explained what directory the path is relative to. Alternatively, it
>> might be nice if there were some variables that could be used in
>> user-configured paths to anchor the path to specific points in the
>> build, output, or source tree.
>>
>> Putting an absolute path in a config file doesn't really seem like a
>> workable option.
>
> Agreed
>
> Somewhere I saw some slides that had a recommended way to do this. It
> also had a minimal post-build script to run. It is on the mailing
> list somewhere.

I think somebody posted a pointer to a week or so back when I was
asking about a change to the customize.mk file.

-- 
Grant Edwards               grant.b.edwards        Yow! I'm having a RELIGIOUS
                                  at               EXPERIENCE ... and I don't
                              gmail.com            take any DRUGS
