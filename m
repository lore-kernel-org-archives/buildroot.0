From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Oct 2017 15:51:43 +0200
Subject: [Buildroot] [PATCH v9 5/5] policycoreutils: split packages and
 bump to 2.7
In-Reply-To: <20171017233454.096a9c41@windsurf.home>
References: <20171017185444.13989-1-Adamduskett@outlook.com>
 <20171017185444.13989-5-Adamduskett@outlook.com>
 <20171017233454.096a9c41@windsurf.home>
Message-ID: <ccc3bb03-752e-7afb-7fe9-c51fbf9b0b35@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-10-17 23:34, Thomas Petazzoni wrote:
> Please don't make this change immediately, but I'm wondering if we
> should use selinux-python or python-selinux. All packages that package
> Python modules are called python-<foo> in Buildroot.
> 
> Is selinux-python somewhat suggested by upstream? Or perhaps it's not
> really a set of Python modules, but rather some SELinux programs that
> happen to be in Python ?

 The upstream tarball if selinux-python-2.7.tar.gz, which is why
SELINUX_PYTHON_SOURCE is not defined. So indeed, it's the upstream choice. For
reference, the Debian source package is called selinux-python while the binary
packages are called python3-sepolgen, policycoreutils-python-utils, ...

 Also, yes, it's just a bunch of programs that happen to be written in python.
Python bindings are part of libselinux itself.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
