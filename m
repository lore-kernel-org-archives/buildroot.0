Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1B1C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 21:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E69382A4E;
	Fri,  7 Jan 2022 21:35:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UcvHhdbfCogY; Fri,  7 Jan 2022 21:35:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B499D823C6;
	Fri,  7 Jan 2022 21:35:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 156BC1BF35A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04B6540148
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:35:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id suyBreSQZREY for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 21:35:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E78CC400B5
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 21:35:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.6])
 by smtp3-g21.free.fr (Postfix) with ESMTP id CDE5B13F846;
 Fri,  7 Jan 2022 22:35:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641591302;
 bh=b7Va0TM8NV6UapPyrUKQpwrPr+lxIhsiHGLfp/foX0M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=p0DSOyaPoA4UggEVnss8RnY+ea+vgZC/DC0J+6nyErG9LjKiAuY9bqv7HDlCvPZ2F
 /uuhQtfZXFrlum09ra/7iYjt3Mqkazr9v/Ib23RiG8GiXDqAb4p6fTLCBh0qdIEsk5
 OCaI/ZgnoSlq1iOzZh0qGgycQeRGqCCgVhTC1ksplDIjqZkufJsnZK6PGQG6lIGfcQ
 Su93VhDvVJlm3K8jaJ6dv9Iwt0a/4+lCOV7lzNg5WybHw4x4zmrpVJHcshlEwtuxaa
 AdmUoZ/qRclFVC5Tl+8dKiITHyFYaMMAIzwQ/rHcky5TI3Z9RoU1mtDc5/M8O99AJx
 i4M5ctcY2Pa7A==
Received: from 37-165-29-190.coucou-networks.fr ([37.165.29.190])
 by webmail.free.fr
MIME-Version: 1.0
Date: Fri, 07 Jan 2022 22:35:01 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20220105142924.4b11ed83@windsurf>
References: <2209e11a-bda9-5193-9b4d-20a5f0fa34e3@linatsea.fr>
 <20220105142924.4b11ed83@windsurf>
Message-ID: <a8098a5d68bcf044356720ec3f7d2d9d@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
Subject: Re: [Buildroot] candidate packages : ros2 and wxwidgets
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Thierry,

I would like to share some info about ROS in Buildroot.

On 05/01/2022 14:29, Thomas Petazzoni wrote:
> Hello Thierry,
> 
> On Wed, 5 Jan 2022 10:46:46 +0100
> Thierry Bultel <thierry.bultel@linatsea.fr> wrote:
> 
>> For a number of companies, I can see a growing interest in having ros2
>> support in buildroot.
>> Currently, people wanting to prototype (or make a product) a robotics
>> applications, are stuck
>> to either yocto, or, worse, to a desktop-like distribution.

[...]

>> What are your thought about these both packages ? Any ideas, or links 
>> to
>> some WIP stuff ?
> 
> These packages would certainly be very welcome. ROS2 especially makes a
> lot of sense.
> 
> Some prior work:
> 
>   https://github.com/mchalain/br_ros
>   http://lists.busybox.net/pipermail/buildroot/2019-March/246497.html
> 
> I'll be happy to help in the review of such packages.


   In the context of the HoverGames https://www.hovergames.com/ drone
challenge, I used ROS1 Noetic (last version for ROS1 series) with
Buildroot on various boards (EMCraft NavQ, Technexion pico-pi, QEmu
aarch64 and RV64). My actual need was the minimal dependencies to run
"mavros" (at that time, mavros was not available for ROS2).

I published my code here, for information:
https://github.com/jolivain/buildroot/commits/navq

See the demo defconfigs:
https://github.com/jolivain/buildroot/commit/a50de54e721910a00ebe7192e37661cc0ad81b37

ROS1 can be tested in qemu Aarch64 virt with:

     make ros_defconfig
     make
     ./output/images/start-qemu.sh

Login as root, then run a ros tutorial:

     roslaunch roscpp_tutorials talker_listener.launch

or launch mavros:

     roslaunch mavros px4.launch fcu_url:=tcp-l://localhost

While doing that, I did minor upstreaming work to let ROS play nicer
with Buildroot, for example:
https://github.com/ros-infrastructure/rospkg/commit/5ab4408e65f01bbb48971f6264f6c890b89cefa9
and few other buildroot fixes or updates.

Prior that work, I was aware of a previous integration, like this one:
https://github.com/flatmax/buildroot.rk3399.external/tree/master/package/rockchip/ros
It was a bit outdated for what I wanted to do.  I took some examples
from it.

While my Buildroot patches were sufficient to fulfill my needs, I
don't think they were good enough to be upstreamed.  Moreover, ROS1
Noetic is the last LTS version which will be EOL in 2025.  See:
https://wiki.ros.org/Distributions#List_of_Distributions
This is why I didn't submitted my patches to Buildroot.

For the next 2022 edition of the HoverGames challenge, I would like
to switch to ROS2 in Buildroot.  I'm currently exploring ways to
regenerate ROS2 buildroot recipes automatically, using the ROS
infrastructure packages.  I believe this is the way the Gentoo and
Yocto/OpenEmbedded recipes are currently generated.

See:
https://github.com/ros-infrastructure/superflore
https://github.com/ros-infrastructure/superflore/tree/master/superflore/generators

My current idea would be to:
- Add in Buildroot the minimum changes, if needed
   (minimal infra things like pkg-catkin, other non-ROS package 
dependencies)
- Propose a "buildroot" generator in superflore upstream that create
   an maintain some of the ROS2 recipes.

Comments, ideas and suggestions are welcome!  Do not hesitate to
contact me to discuss that topic.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
