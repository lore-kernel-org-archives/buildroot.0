From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 29 Oct 2014 18:54:00 -0300
Subject: [Buildroot] [PATCH v2 1/2] libffi: make thread support optional
In-Reply-To: <20141029222418.17f91967@free-electrons.com>
References: <1410784002-8659-1-git-send-email-jezz@sysmic.org>
 <20141029222418.17f91967@free-electrons.com>
Message-ID: <545161F8.5040207@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/29/2014 06:24 PM, Thomas Petazzoni wrote:

> To be honest, I am wondering if we really should bother merging a patch
> to make libffi usable on configurations that have thread support
> disabled. Nowadays, not having thread support is also impossible due to
> the large number of libraries/applications that rely on threads. libffi
> is generally used in "big" things like Python or glib, so not having
> thread support in systems using such big things is a bit unlikely.
> 
> In addition, I'm not sure the patch could be upstreamed as is, which
> means we would have to carry it in Buildroot forever.
> 
> Peter, Arnout, Gustavo, what is your point of view on this?

+1, ditching threads (uClibc) is for really small targets which these
days would mostly mean noMMU.
Regards.
