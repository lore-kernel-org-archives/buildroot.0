From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 15 Jul 2020 11:19:44 -0500
Subject: [Buildroot] [2020.02.x] package/python-twisted: Fix several
 request smuggling attacks
In-Reply-To: <20200715153056.26874-1-matthew.weber@rockwellcollins.com>
References: <20200715153056.26874-1-matthew.weber@rockwellcollins.com>
Message-ID: <CANQCQpaRVk7h6sEY-Ucs10kwvT6HWHEgdOdVvTwxVhgf7xkjfA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 15, 2020 at 10:30 AM Matt Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> CVE-2020-10108
> In Twisted Web through 19.10.0, there was an HTTP request splitting
> vulnerability. When presented with two content-length headers, it
> ignored the first header. When the second content-length value was
> set to zero, the request body was interpreted as a pipelined request.
>
> CVE-2020-10109
> In Twisted Web through 19.10.0, there was an HTTP request splitting
> vulnerability. When presented with a content-length and a chunked
> encoding header, the content-length took precedence and the remainder
> of the request body was interpreted as a pipelined request.

Up to and including 19.10.0 requires this patch (2020.02.x) and 20.3.0
on master already has the fix  [1].


Regards,
Matt

[1] https://github.com/twisted/twisted/commit/4a7d22e490bb8ff836892cc99a1f54b85ccb0281
