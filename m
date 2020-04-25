From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 15:25:01 +0200
Subject: [Buildroot] [PATCH 1/1] utils: add a csv to xml conversion
 script for legal info, rendering as html
In-Reply-To: <20191027161523.30907-1-nicolas.carrier@orolia.com>
References: <20191027161523.30907-1-nicolas.carrier@orolia.com>
Message-ID: <20200425152501.610b7663@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Cc the other Buildroot maintainers, as I'm taking a decision on this.

On Sun, 27 Oct 2019 16:15:30 +0000
Nicolas Carrier <nicolas.carrier@orolia.com> wrote:

> An xsl file is provided alongside the python script, which is referenced
> by the generated xml.
> This xsl file can be customized at will by users if they want to add, say
> extra information, styling or even a logo...
> When the xml file is served in http, browsers like firefox can render it
> as if it was pure HTML.
> 
> Otherwise, the following command-line can generate actual HTML from this
> xml:
>     xsltproc --output manifest.html manifest.xml
> 
> The current script version passes flake8 with no warning.
> 
> Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>

So, I'm not thrilled by this, for several reasons:

 - Why generate a CSV, and then convert to it to XML ? If anything,
   let's generate the XML directly.

 - Why XML ? We already have CSV information for legal-info, and JSON
   output for "make show-info". Let's not add another data description
   "language".

 - We know have "make show-info", which pretty much gives the same
   information as what is in the legal-info manifest. If not, we can
   probably extend the "show-info" output.

So, I'm going to mark this patch as rejected.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
