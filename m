From: =?UTF-8?Q?Piotr_=C5=81obacz?= <piotr.lobacz@softgent.com>
Date: Mon, 30 Nov 2020 07:29:16 -0600 (CST)
Subject: [Buildroot] Problem adding a new package tpm2-tss-engine
In-Reply-To: <VI1PR03MB45283D1D35C28CBE34590C5D98550@VI1PR03MB4528.eurprd03.prod.outlook.com>
References: <VI1PR03MB45286A4A50F37EBB0DC2E56298560@VI1PR03MB4528.eurprd03.prod.outlook.com>
 <20200824160337.GB2246@scaer>
 <VI1PR03MB4528F54C1492D171A1B7B37B98560@VI1PR03MB4528.eurprd03.prod.outlook.com>
 <20200824163801.GC2246@scaer>
 <VI1PR03MB452804C180D2B7AC473E9F0B98570@VI1PR03MB4528.eurprd03.prod.outlook.com>
 <VI1PR03MB45283D1D35C28CBE34590C5D98550@VI1PR03MB4528.eurprd03.prod.outlook.com>
Message-ID: <1606742956393-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marie,
i have used your packages files and solved your issue. The problem was that
the tpm2-tss-engine.mk was incomplete. I had to add host-autoconf-archive to
the dependencies and also this line:

 TPM2_TSS_ENGINE_AUTORECONF_OPTS = -I $(HOST_DIR)/share/autoconf-archive 

after TPM2_TSS_ENGINE_AUTORECONF = YES

and all is building correctly.

BR
Piotr



--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
