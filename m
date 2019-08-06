From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Aug 2019 21:40:14 +0200
Subject: [Buildroot] [PATCH 4/6] autobuild-run: make diffoscope output
 to a JSON-formatted file
In-Reply-To: <20190806181251.21885-4-itsatharva@gmail.com>
References: <20190806181251.21885-1-itsatharva@gmail.com>
 <20190806181251.21885-4-itsatharva@gmail.com>
Message-ID: <20190806214014.52c8839b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Atharva,

On Tue,  6 Aug 2019 23:42:49 +0530
Atharva Lele <itsatharva@gmail.com> wrote:

> Normal diffoscope output is readable by humans but not really
> convenient when working with it in code. JSON can be easily
> read and extracted information from.
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>

Peter and I had a look at the diffoscope output, and while the JSON
version is definitely good for human parsing, having the text version
in addition for humans to read would also be nice.

Could you instead store both the JSON and text versions ?

Just run this:

$ diffoscope --text differences.txt --json differences.json rootfs.tar rootfs.tar.before

And you'll get both the JSON and text version in files.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
