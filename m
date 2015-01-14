From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Jan 2015 16:35:46 -0300
Subject: [Buildroot] [PATCH 4/7] rsyslog: clean up sysv initscript
In-Reply-To: <20150114203112.3412efb6@free-electrons.com>
References: <1421191022-5509-1-git-send-email-gustavo@zacarias.com.ar>	<1421191022-5509-4-git-send-email-gustavo@zacarias.com.ar>
 <20150114203112.3412efb6@free-electrons.com>
Message-ID: <54B6C512.3090006@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/14/2015 04:31 PM, Thomas Petazzoni wrote:

> Do we really need this umask 077 ?

Leftover, i'll kill it.

> And this sleep 1 ?

Unfortunately yes, it seems rsyslogd doesn't exit immediately from the
tests i've made, otherwise i got restart problems in very few cases.
Regards.
