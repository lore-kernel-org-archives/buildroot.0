From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jul 2012 00:46:33 +0200
Subject: [Buildroot] [PATCH v4 1/5] target: add symbols for i386/x86_64
 cpu features
In-Reply-To: <CAHXCMMLQ483eb6w9OUi0ycwt=sFQBSkA8twNB237Coa2ZjHvsw@mail.gmail.com>
References: <1341528156-4197-1-git-send-email-s.martin49@gmail.com>
 <1341528156-4197-2-git-send-email-s.martin49@gmail.com>
 <4FFBC796.9030204@mind.be> <20120713232622.5a42e405@skate>
 <CAHXCMMLQ483eb6w9OUi0ycwt=sFQBSkA8twNB237Coa2ZjHvsw@mail.gmail.com>
Message-ID: <20120714004633.4ee5c344@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 13 Jul 2012 23:57:15 +0200,
Samuel Martin <s.martin49@gmail.com> a ?crit :

> You prefer expressing dependencies using "depends on" keyword instead
> "select", is it right?

It depends on the case. Which case are you talking about?

> I'm not sure I got what you mean by "having subarchitecture options",
> could you explain?

The different MMX, SSE, SSE2, SSE3 options are selected by the
"Architecture Variant" options. However, the SSE4 options are not
selected by any "Architecture Variant" that currently exists in
Buildroot. I'd prefer not to have such dead/unused code, so either the
corresponding Architecture Variants should be added, or the SSE4
related options should not be added for now (until someone actually
needs those Architecture Variants).

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
