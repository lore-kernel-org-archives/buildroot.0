From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 2 Apr 2017 05:40:08 +0200
Subject: [Buildroot] [PATCH v3] autofs: allow to use libtirpc instead of
 internal C implementation
In-Reply-To: <20170323071058.GA29887@waldemar-brodkorb.de>
References: <20170323071058.GA29887@waldemar-brodkorb.de>
Message-ID: <20170402034008.GB5361@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ping?

Waldemar Brodkorb wrote,

> uClibc-ng plans to remove internal RPC implementation as it
> is ipv4 only and can not be used for most important RPC software
> rpcbind and nfs-utils.
> musl does not implement RPC and GNU C library deprecated the
> internal implementation a while ago.
> It is still possible to use the C library implementation.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---                                                                                                                                                                       
> v1 -> v2:                                                                                                                                                                 
>   - Thomas Petazzoni wants to keep legacy C library provided RPC support  
> v2 -> v3:
>   - combine with BR2_PACKAGE_LIBTIRPC conditionally, suggested by Baruch Siach
