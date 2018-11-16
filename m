From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Nov 2018 20:25:36 +0100
Subject: [Buildroot] [PATCH next] package/pkg-luarocks: use
 <pkg>_EXTRACT_DEPENDENCIES
In-Reply-To: <20181116135300.27234-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 16 Nov 2018 14:53:00 +0100")
References: <20181116135300.27234-1-thomas.petazzoni@bootlin.com>
Message-ID: <87h8ggsu33.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The host luarocks tool is needed when *extracting* luarocks
 > packages. Since regular dependencies are only available at the
 > configure step, it caused the "luarocks" program to be available too
 > late to be used to extract luarocks packages.

 > To work around this, host-luarocks was manually added as a dependency
 > of the extract step of luarocks packages. While this worked fine until
 > now, it breaks badly with per-package folders, because host-luarocks
 > is not recorded as an extract dependency of luarocks packages, and
 > therefore is not copied to the per-package host folder, causing a
 > failure.

 > In the mean time, the <pkg>_EXTRACT_DEPENDENCIES mechanism was added,
 > which aims at fixing exactly this problem, so let's use it and
 > simplify pkg-luarocks.mk.

 > Cc: Francois Perrad <francois.perrad@gadz.org>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
