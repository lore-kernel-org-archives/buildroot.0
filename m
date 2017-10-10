From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Oct 2017 02:47:59 +0200
Subject: [Buildroot] [PATCH 1/8] libselinux: bump to 2.7
In-Reply-To: <20171009222731.15119-1-Adamduskett@outlook.com>
References: <20171009222731.15119-1-Adamduskett@outlook.com>
Message-ID: <8f8f5547-b7f4-8172-4989-36a5d8767c16@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Adam,

On 10-10-17 00:27, Adam Duskett wrote:
> remove patch as it's in this release.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
[snip]
> -LIBSELINUX_VERSION = 2.6
> -LIBSELINUX_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20161014
> +LIBSELINUX_VERSION = 2.7
> +LIBSELINUX_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804

 You update all the individual packages in separate patches, which is excellent
for review. However, I wonder if it is really possible to update just one of
them without updating the rest. Does libselinux-2.7 work with libsepol-2.7?

 If not, we should probably squash all patches into one single patch while
applying. Thomas, Peter, do you agree?

 With that in mind, it would probably be useful to define a global
SELINUX_VERSION and SELINUX_SITE that is used in all those packages. Then
updating is only possible with all packages combined, which is harder to review
but probably what we want anyway. Making this global SELINUX_VERSION and
SELINUX_SITE can be done independently of this series later.

 Regards,
 Arnout

>  LIBSELINUX_LICENSE = Public Domain
>  LIBSELINUX_LICENSE_FILES = LICENSE
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
