Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E8BC38150
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 01:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1700E80E3E;
	Mon,  8 Jul 2024 01:37:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mdF_SbgAYF1F; Mon,  8 Jul 2024 01:37:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 106CF80E40
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 106CF80E40;
	Mon,  8 Jul 2024 01:37:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BDEDF1BF82C
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 01:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA4AE401F3
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 01:37:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1zE9yTShaFPk for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 01:37:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=159.65.134.6;
 helo=zg8tmtu5ljy1ljeznc42.icoremail.net;
 envelope-from=zhangdongdong@eswincomputing.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1191840142
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1191840142
Received: from zg8tmtu5ljy1ljeznc42.icoremail.net
 (zg8tmtu5ljy1ljeznc42.icoremail.net [159.65.134.6])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1191840142
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 01:37:43 +0000 (UTC)
Received: from ubuntu18.eswin.cn (unknown [10.12.192.173])
 by app1 (Coremail) with SMTP id TAJkCgDXauLdQotmaHIUAA--.34904S4;
 Mon, 08 Jul 2024 09:37:34 +0800 (CST)
From: zhangdongdong@eswincomputing.com
To: buildroot@buildroot.org
Date: Mon,  8 Jul 2024 09:37:17 +0800
Message-Id: <20240708013718.19051-1-zhangdongdong@eswincomputing.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: TAJkCgDXauLdQotmaHIUAA--.34904S4
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY77AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E
 6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
 kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8I
 cVCY1x0267AKxVWxJr0_GcWl84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2js
 IEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE
 5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeV
 CFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l
 w4CEc2x0rVAKj4xxMxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
 0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2Kf
 nxnUUI43ZEXa7VUjRVbDUUUUU==
X-CM-SenderInfo: x2kd0wpgrqwvxrqjqvxvzl0uprps33xlqjhudrp/1tbiAQEMCmaKYPEWvQAAsQ
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=eswincomputing.com
Subject: [Buildroot] [PATCH v2 0/1] .github: add github action to automate
 PR handling
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
Cc: bonet@grenoble.cnrs.fr, Dongdong Zhang <zhangdongdong@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dongdong Zhang <zhangdongdong@eswincomputing.com>

Changes in v2:
    - Adopted Edgar Bonet's suggestion to retain the original 
      pull request template.Restored .github/pull_request_template.md
      to its original form. This way, developers will see the prompt 
      when creating a pull request, without having to wait for the 
      workflow to complete.

Dongdong Zhang (1):
  .github: add github action to automate PR handling

 .github/workflows/repo-lockdown.yml | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 .github/workflows/repo-lockdown.yml

-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
