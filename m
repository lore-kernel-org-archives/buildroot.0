From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 20 May 2021 14:25:56 +0300
Subject: [Buildroot] [PATCH 1/2] package/libpsl: new package
In-Reply-To: <2fbad602-ec9f-bce7-acce-759a4981c3d7@mind.be>
References: <20210519212637.1282972-1-aperez@igalia.com>
 <20210519212637.1282972-2-aperez@igalia.com>
 <999661ba-f9cf-6b66-c442-921595b49176@mind.be>
 <20210520134959.GB1322222@momiji>
 <2fbad602-ec9f-bce7-acce-759a4981c3d7@mind.be>
Message-ID: <20210520142556.GB1327068@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 20 May 2021 13:10:43 +0200 Arnout Vandecappelle <arnout@mind.be> wrote:
> 
> 
> On 20/05/2021 12:49, Adrian Perez de Castro wrote:
> > As a related note: it is interesting that libpsl can be built against ICU
> > because it is possible to have a configuration that needs ICU (as a dependency
> > for WPE WebKit, for example) without any other package needing libidn/libidn2.
> > So that's neat :)
> 
>  libidn2 is so tiny (or rather, ICU is so huge) that it doesn't matter much IMHO.

True, libidn2 is tiny in comparison. Anyway, with v2 of the patch set I
changed the order of checks to prefer libidn2 if it is selected, which
matches the preference used by the build system :)

Cheers,
-Adrian
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210520/e3f65d12/attachment.asc>
