From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Sep 2015 23:05:57 +0200
Subject: [Buildroot] LD_LIBRARY_PATH variable
In-Reply-To: <CAJ2oMh+nrOjF8VK0FmCj7KuL=29rF_vtqEO7A+99OTh5Ov00RQ@mail.gmail.com>
References: <CAJ2oMh+nrOjF8VK0FmCj7KuL=29rF_vtqEO7A+99OTh5Ov00RQ@mail.gmail.com>
Message-ID: <55F88835.3060403@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15-09-15 22:55, Ran Shalit wrote:
> Hello,
> 
> I have some strange issue, in which I have to export LD_LIBRARY_PATH
> (.../output/host/usr/lib), otherwise the build fails on not ""cannot
> open shared object file: No such file or directory.... " during build
> (with the make command without any arguments).
> The strange thing is that I done it several times before without
> specifying the export command, so I really don't understand what
> happened in my host environment that requires this additional command.
> 
> But now I get a new error during build:
> fakeroot: preload library `libfakeroot.so' not found, aborting.
> 
> On checking I do see that it exist in .../output/host/usr/lib
> Is there any idea what's wrong ?

 Have you moved your output directory to a different location? Everything that
is built for the host will look for shared libraries using an absolute path, so
if you move it to a different place, it will fail. There were some patches to
convert the absolute paths to relative paths using patchelf, but that was not
yet ready for committing.

 But specifically for fakeroot: that's just a script, and the path is hardcoded
in it. Look in host/usr/bin/fakeroot.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
