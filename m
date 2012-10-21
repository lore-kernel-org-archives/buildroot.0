From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 21 Oct 2012 16:42:21 -0300
Subject: [Buildroot] [PATCH] openssl: disable apps for NOMMU
In-Reply-To: <876263tz4u.fsf@macbook.be.48ers.dk>
References: <1350388760-5447-1-git-send-email-gustavo@zacarias.com.ar>
 <876263tz4u.fsf@macbook.be.48ers.dk>
Message-ID: <5084501D.8080405@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/21/12 16:15, Peter Korsgaard wrote:

> Why is this not BR2_PACKAGE_OPENSSL_BIN instead?

Because the change must be done before anything is built.
Since i'm only tweaking the build phase and not the install one in the
build system i need to fake the openssl being built with the touch.
It will then be removed by the BR2_PACKAGE_OPENSSL_BIN knob when it's nommu.
Or maybe i misunderstood what you meant?
Regards.
