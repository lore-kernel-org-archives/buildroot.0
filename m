From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 17 Feb 2015 15:20:04 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-02-16
In-Reply-To: <20150217073016.9F5601017A8@stock.ovh.net>
References: <20150217073016.9F5601017A8@stock.ovh.net>
Message-ID: <54E34E14.7000308@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,

On 17/02/15 08:30, Thomas Petazzoni wrote:
> Build statistics for 2015-02-16
> ===============================
>       mipsel | mjpg-streamer-730b5bcdc378b... | NOK | http://autobuild.buildroot.net/results/cd52b739370d57b5ecbc6472b8c7f1126700e85f/

this package is failing when building it statically because it tries to
build the plugins which are shared objects. The mjpg_streamer binary
loads those plugins using "dlopen". This application seems useless
without those plugins, so, do you agree to disable this package when
BR2_STATIC_LIBS == y?

Thanks.
--
Vincent
