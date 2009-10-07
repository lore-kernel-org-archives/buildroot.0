From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 7 Oct 2009 10:28:45 -0300
Subject: [Buildroot] [PATCH 20/23] qt: simplify and fix installing qt in
	the target
In-Reply-To: <20091007131455.0e427cd0@surf>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-21-git-send-email-mroth@nessie.de>
	<20091007131455.0e427cd0@surf>
Message-ID: <d6cda7730910070628o5aa5ea61lf1c07d967ca87bc1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Oct 7, 2009 at 8:14 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Wed, ?7 Oct 2009 11:20:43 +0200,
> Michael Roth <mroth@nessie.de> a ?crit :
>
> Ok, but two remarks:
>
> ?2. The installation of the libraries to the target/ directory will
> ? ?include the unnecessary libQt*.so symbolic link (only libQt*.so.X
> ? ?symbolic links + the library itself are really needed for the
> ? ?runtime)
>

Also, you seems to drop the BR2_PACKAGE_QT_SHARED checks. If the
library is built static, those files won't exist. The whole for could
be skiped. Also plugins install could be skipped, as Qt won't allow
for shared library plugins when the library itself is static.

Kind Regards,
    Thiago A. Correa
