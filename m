From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Oct 2017 19:07:56 +0200
Subject: [Buildroot] [PATCH v2 1/6] support/testing: allow to indent
 ccache defconfig fragment
In-Reply-To: <20171005214212.27613-1-ricardo.martincoski@gmail.com>
References: <20170929022713.2967-1-ricardo.martincoski@gmail.com>
 <20171005214212.27613-1-ricardo.martincoski@gmail.com>
Message-ID: <8c06086e-15a4-71f4-14ac-18fd17341baf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Ricardo,

On 05-10-17 23:42, Ricardo Martincoski wrote:
> Move the strip out of leading spaces in defconfig fragments from the
> BRTest class to the Builder class. It actually postpones the strip out,
> consequentially allowing test cases to post-process the defconfig in
> their own __init__ before calling the __init__ method from BRTest.
> 
> Moving this code to the Builder class also allows any new test class
> that inherits from BRTest to reuse the same code even if the new class
> overrides the setUp method.
> 
> At same time, prepend a newline to the jlevel handling otherwise it
> would stop working for defconfig fragments that don't end in a newline.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>

 Series applied to master, thanks! Some remarks in separate mails.

 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
