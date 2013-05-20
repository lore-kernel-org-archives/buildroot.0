From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 20 May 2013 00:25:00 -0300
Subject: [Buildroot] [PATCH] wireshark: security bump to version 1.8.7
In-Reply-To: <20130520025525.GC7188@tarshish>
References: <1369007247-27993-1-git-send-email-gustavo@zacarias.com.ar>
 <20130520025525.GC7188@tarshish>
Message-ID: <5199978C.3040702@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/19/2013 11:55 PM, Baruch Siach wrote:
> Have you seen an actual build failure caused by this missing dependency?

Hi.
No, it's unreachable because glib2 is always failing before with it's
own fork()ing.
It's used in capture_sync.c which is mandatory even for tshark, so it
would fail even if glib2 worked.
Regards.
