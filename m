From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jun 2018 16:39:31 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/ca-certificates: don't hash
 certificates.crt
In-Reply-To: <CAFGQKxeOmRCBUu7XFCDkpRbFV51F0=A8htjRMc75rKQA8_VtoQ@mail.gmail.com>
References: <20180616220601.4629-1-martin@barkynet.com>
 <20180616220601.4629-2-martin@barkynet.com>
 <20180617212547.4bc868c3@windsurf>
 <CAFGQKxeOmRCBUu7XFCDkpRbFV51F0=A8htjRMc75rKQA8_VtoQ@mail.gmail.com>
Message-ID: <20180618163931.4531ccb3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Jun 2018 10:51:34 +0100, Martin Bark wrote:

> > output/target$ ls -l etc/ssl/certs/128805a3.0
> > lrwxrwxrwx 1 thomas thomas 35 Jun 17 20:58 etc/ssl/certs/128805a3.0 -> EE_Certification_Centre_Root_CA.pem  
> 
> Did you check other hashes under etc/ssl/certs/ ? Check for any hashes
> that link to ca-certificates.crt. I suspect you have a different hash
> pointing to ca-certificates.

There are no files in /etc/ssl/certs that are symlinks to
ca-certificates.crt:

output/target$ ls -l etc/ssl/certs/| grep ca-certificates.crt
-rw-r--r-- 1 thomas thomas 207436 Jun 18 15:30 ca-certificates.crt

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
