From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Oct 2017 02:01:24 +0200
Subject: [Buildroot] [PATCH 6/8] sepolgen: Remove package
In-Reply-To: <20171009222731.15119-6-Adamduskett@outlook.com>
References: <20171009222731.15119-1-Adamduskett@outlook.com>
 <20171009222731.15119-6-Adamduskett@outlook.com>
Message-ID: <3d523201-24ff-23f4-dd44-d91fe1370ad3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Adam,

On 10-10-17 00:27, Adam Duskett wrote:
> sepolgen has been consolidated into the selinux-python package for version
> 2.7.

 We want people to be able to upgrade their Buildroot by doing:

git pull
make menuconfig

i.e. they should not loose any package that they previously had.

 In this case, people who previously had sepolgen selected will now NOT have it
anymore if they didn't have selinux-python selected.

 Therefore, you need to create an entry in Config.in.legacy that selects
selinux-python. Its help text should have what you had in the commit message here.


 Regards,
 Arnout

> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
>  package/Config.in              |  1 -
>  package/sepolgen/Config.in     | 19 ----------------
>  package/sepolgen/sepolgen.hash |  2 --
>  package/sepolgen/sepolgen.mk   | 49 ------------------------------------------
>  4 files changed, 71 deletions(-)
>  delete mode 100644 package/sepolgen/Config.in
>  delete mode 100644 package/sepolgen/sepolgen.hash
>  delete mode 100644 package/sepolgen/sepolgen.mk

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
