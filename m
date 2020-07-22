From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 23:12:13 +0200
Subject: [Buildroot] [2020.02.x] package/python-twisted: Fix several
 request smuggling attacks
In-Reply-To: <20200715153056.26874-1-matthew.weber@rockwellcollins.com> (Matt
 Weber's message of "Wed, 15 Jul 2020 10:30:56 -0500")
References: <20200715153056.26874-1-matthew.weber@rockwellcollins.com>
Message-ID: <875zaffe4y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > CVE-2020-10108
 > In Twisted Web through 19.10.0, there was an HTTP request splitting
 > vulnerability. When presented with two content-length headers, it
 > ignored the first header. When the second content-length value was
 > set to zero, the request body was interpreted as a pipelined request.

 > CVE-2020-10109
 > In Twisted Web through 19.10.0, there was an HTTP request splitting
 > vulnerability. When presented with a content-length and a chunked
 > encoding header, the content-length took precedence and the remainder
 > of the request body was interpreted as a pipelined request.

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
