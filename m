From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Mar 2013 22:47:07 +0100
Subject: [Buildroot] [PATCH] change default location for local.mk to
	$(CONFIG_DIR)
In-Reply-To: <1706669320.395518.1363075932486.JavaMail.root@openwide.fr>
References: <1706669320.395518.1363075932486.JavaMail.root@openwide.fr>
Message-ID: <513FA25B.5030908@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/12/13 09:12, Jeremy Rosen wrote:
>> Dear J?r?my Rosen,
>>
>> On Thu,  7 Mar 2013 11:49:23 +0100, J?r?my Rosen wrote:
>>> the previous default of $(TOPDIR) broke the philosophy of builds
>>> with O=
>>> which try to keep all configuration files within the $(CONFIG_DIR)
>>> subtree
>>
>> Hum, that's an interesting vision of things. I think I would tend to
>> agree with this idea.
>>
>> What do others think?
>>
>
> A bit of context :
>
> I am trying to keep my buildroot project in git, but I am trying to
> cleanly separate "changes made to git" and "changes due to my project.
>
> that basically means that all config file needs to be out of the
> buildroot/ subdirectory to be able to easily generate patches against
> mainline and still keep my changes in git. I do that using git-subtree
>
> I also change the location of the kernel config file for the same reason
> and would do that for ctng and busybox if I needed to change them from
> their default config

  But $(CONFIG_DIR) is not a good location then... $(CONFIG_DIR) is 
$(TOPDIR) if doing in-tree build, and $(O) if doing out-of-tree build. 
When you delete your out-of-tree dir, local.mk will also be gone...

  I also don't really like the idea that with a defconfig, the build 
result will be different when you change the O= command line parameter.


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
