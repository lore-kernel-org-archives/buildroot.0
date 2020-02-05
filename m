From: Frank Vanbever <frank.vanbever@essensium.com>
Date: Wed, 05 Feb 2020 12:15:19 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/erlang: bump to version 22.2
In-Reply-To: <20200205103739.62be0ec6@windsurf>
References: <20200129172618.16966-1-frank.vanbever@essensium.com>
 <20200204100733.22106-1-frank.vanbever@essensium.com>
 <20200205103739.62be0ec6@windsurf>
Message-ID: <2231542.ug6IuTeUKT@wintermute>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Wednesday, 5 February 2020 10:37:39 CET Thomas Petazzoni wrote:
> Why is this save_bootstrap now needed ?

During development I encountered build failures due to the following file not 
being present:

    otp_src_22.2/bootstrap/lib/kernel/include/logger.hrl

The save_bootstrap command creates this file.

I attempted to reproduce this build failure today and I am unable to do so.
Likely the behaviour I saw was an artifact of some manipulation I did to fix 
the build rather than inherent to Erlang itself.

AFAICT all lines related to ERLANG_RUN_SAVE_BOOTSTRAP can be removed as they 
serve no purpose. This is as you mention also supported by the Erlang 
documentation.

Given that it's removing code is this still something you can amend during the 
merge or do you want me to resubmit the patches?

Br,
Frank
