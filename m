From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 21:23:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/mender-artifact: fix module
 permissions
In-Reply-To: <20200813184947.4042927-1-aduskett@gmail.com>
References: <20200813184947.4042927-1-aduskett@gmail.com>
Message-ID: <20200813212356.5f9d17d3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 13 Aug 2020 11:49:47 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Modules downloaded with "go mod" are downloaded as read-only, which the Go
> maintainers have intentionally done.
> https://github.com/golang/go/issues/27161
> 
> As mender-artifact now uses go modules, when cleaning, a user will receive
> permission-denied errors due to the above issue.
> 
> The fix, however, is relatively straight forward. Setting the "-mod=vendor"
> flag in the GO_ENV will set go modules to read/write, which allows
> "make clean" to work correctly.
> 
> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Thanks, but will this fix the host-mender-artifact download issues as
well ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
