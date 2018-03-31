From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 31 Mar 2018 23:09:43 +0200
Subject: [Buildroot] [PATCH 13/15 v4] fs: run packages' filesystem hooks
 in a copy of target/
In-Reply-To: <87bmf4t2go.fsf@dell.be.48ers.dk>
References: <cover.1522487149.git.yann.morin.1998@free.fr>
 <193b195e0bb305f01ccedd565a517635a975b154.1522487149.git.yann.morin.1998@free.fr>
 <cbd0a228-12b8-9a72-f4bc-311f4c95d001@mind.be>
 <87bmf4t2go.fsf@dell.be.48ers.dk>
Message-ID: <ac9b3e12-1746-40fa-5a11-39b0672ab32a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31-03-18 22:27, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
> Hi,
> 
>  >> mkdir -p $(FS_DIR)
>  >> +	rsync -au $(BASE_TARGET_DIR)/ $(TARGET_DIR)
> 
>  >  This would benefit a lot from using the --link-dest= that we will also use in
>  > PPS, in my opinion.
> 
> Wouldn't hard links be potentially dangerous - E.G. in case a script
> appends to a file.

 If this is a script that runs in the context of building a package, then the
hard link does exactly what we want.

 If it is a script that runs in the context of rootfs generation, you have a point.

 If your target is a bit large and you have several filesystems to support, I
expect that making all these copies is really going to hit you in build time for
a simple package rebuild. Of course, we can fix that problem when it happens.

 Regards,
 Arnout


> As I mentioned in my comments to patch 15, we could as well use cp
> instead of rsync as we throw away the copy after each build.

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
