From: Bernhard Fischer <rep.nop@aon.at>
Date: Wed, 29 Nov 2006 14:27:15 +0100
Subject: [Buildroot] List of broken packages
In-Reply-To: <20061129093412.GE26441@aon.at>
References: <1164787709.5573.6.camel@dv> <20061129093412.GE26441@aon.at>
Message-ID: <20061129132715.GA6630@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 29, 2006 at 10:34:12AM +0100, Bernhard Fischer wrote:
>On Wed, Nov 29, 2006 at 03:08:29AM -0500, Pavel Roskin wrote:
>>Hello!
>>
>>This is the complete list of the packages I had to disable when
>>cross-compiling current Buildroot on x86_64 for i686:

>>BR2_PACKAGE_OPENSWAN
>>(oswlog.c:46: error: expected '=', ',', ';', 'asm' or '__attribute__'
>>before 'openswan_passert_fail)
>
>That's guarded by !defined(NO_DEBUG) and we build with -DNO_DEBUG.
>Curious as to why you see this.. Works For Me, fwiw..

hmz. It helps if one actually applies the patches ;)
Fixed in r16719.
