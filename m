From: Simon Dawson <spdawson@gmail.com>
Date: Tue, 26 Jun 2012 09:32:02 +0100
Subject: [Buildroot] [PATCH RFC 1/2] Add configuration item for custom
 JavaScript install path
In-Reply-To: <4FE25F07.6020103@mind.be>
References: <1340088964-10630-1-git-send-email-spdawson@gmail.com>
 <1340088964-10630-2-git-send-email-spdawson@gmail.com>
 <4FE25F07.6020103@mind.be>
Message-ID: <CAHt8ZCPKVG8VNUhYbzTV+u6VZgFnHCw5+8_--_+xE0XV7gnutw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the feedback Arnout.

On 21 June 2012 00:38, Arnout Vandecappelle <arnout@mind.be> wrote:
> ?I would instead define a WWW_INSTALL_PATH, which can also be used to set
> the wwwroot of the various http servers.

It's a good idea, but I don't know quite how it would be achieved
cleanly. A quick grep through Buildroot reveals the following
potential problem files.

* package/boa/boa.conf
* package/tinyhttpd/S85tinyhttpd
* package/tinyhttpd/tinyhttpd.patch

The configuration files could be fixed up during installation of the
relevant packages, but the httpd patch is more of a problem.

Does anyone have a suggestion for how to deal with this?

Simon.
