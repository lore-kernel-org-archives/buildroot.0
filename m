From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Oct 2017 19:09:43 +0200
Subject: [Buildroot] [PATCH v2 4/6] testing/tests/init: use lowercase
	method names
In-Reply-To: <20171005214212.27613-4-ricardo.martincoski@gmail.com>
References: <20170929022713.2967-1-ricardo.martincoski@gmail.com>
 <20171005214212.27613-4-ricardo.martincoski@gmail.com>
Message-ID: <86443cc6-ea89-6d94-f833-685a9d86e029@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-10-17 23:42, Ricardo Martincoski wrote:
> Use method naming convention from PEP8 as other test cases already do.
> 
> sed \
>   -e 's,startEmulator,start_emulator,g' \
>   -e 's,checkInit,check_init,g' \
>   -e 's,checkNetwork,check_network,g' \
>   -i support/testing/tests/init/*.py

 Very nice that you put this in the commit log, makes it easy to double-check
the patch. Personally, I'd have writting it as

find support/testing -name \*.py | xargs sed -i ...

so it works across directories, but that's not relevant now :-)

 Regards,
 Arnout

> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
