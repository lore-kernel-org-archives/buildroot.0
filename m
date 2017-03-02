From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 2 Mar 2017 23:19:50 +0100
Subject: [Buildroot] [PATCH 13/25] package/Config.in: explain that lua
 package names should start with lua
In-Reply-To: <20170302225033.4c38fbab@free-electrons.com>
References: <20170223170047.24417-1-arnout@mind.be>
 <20170223170047.24417-14-arnout@mind.be>
 <20170302225033.4c38fbab@free-electrons.com>
Message-ID: <a9a0a363-1c91-c50a-6f5d-a058c8fd4e4b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-03-17 22:50, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 23 Feb 2017 18:00:35 +0100, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>> We have decided that lua packages should have a name that starts with
>> lua (like is the case for python and perl). However, we're not going to
>> rename all the existing lua packages that don't start with lua. This
>> makes it unclear for people adding packages how they should name the
>> package, so add a comment to package/Config.in to explain it.
> 
> Should we require "lua" as a prefix or "lua-" ? For Perl and Python, we
> use "perl-" and "python-" respectively.
> 
> We currently have 10 packages that start with "lua-", and 12 that start
> with just "lua".

 The problem is that we want to use upstream names. The upstream name of
luaposix is luaposix. We certainly don't want to change that into lua-posix, and
making it lua-luaposix would be weird as well. Note that Debian does call it
lua-posix. So to use the lua-posix package, you have to do 'require "luaposix"',
which makes little sense IMHO.

 For me, the important thing is that I can see in the package directory which
packages are lua-related. I'm not really bothered with seeing a mix of lua-foo
and luabar.

 Perl is different because module names (almost?) never start with Perl. Python
is different because package names sometimes are like pyfoo, but never
python-foo, and we have indeed chosen to make it python-pyfoo.

 If people think it would be better for consistency to have lua-luafoo, I can
live with that (just 3 letters more). But do keep in mind that we have already
forsaken consistency because of the historical discrepancy.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
