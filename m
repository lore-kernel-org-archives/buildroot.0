From: Jeremy Kerr <jk@ozlabs.org>
Date: Mon, 12 Mar 2018 12:57:18 +0800
Subject: [Buildroot] patchwork.ozlabs.org down, and e-mails not recorded
In-Reply-To: <20180312015055.3dc9789c@canb.auug.org.au>
References: <20180105214340.6f0cc1f7@windsurf>
 <ced2aeb2-82f6-c836-dd5a-e65c6b49c81a@au1.ibm.com>
 <20180108091044.1141f540@windsurf> <20180205224500.1a34e02a@windsurf>
 <981ecf77-767e-3c90-243f-67251d956c21@au1.ibm.com>
 <20180213231930.26ab0efb@windsurf.lan>
 <16c3e28e-8da0-75f0-1f9a-c1ed86741fc3@au1.ibm.com>
 <20180214090148.5b21f55e@windsurf.lan> <87lgftau6p.fsf@linkitivity.dja.id.au>
 <20180216154959.4db712f5@windsurf.lan> <874llocfch.fsf@dell.be.48ers.dk>
 <20180312015055.3dc9789c@canb.auug.org.au>
Message-ID: <7a371f6c-1705-dcf6-2ff5-dc5ba46b7114@ozlabs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Daniel,

> We have quite a few of these sitting in our queue :-(

After a bit of time with some extra debug enabled for the buildroot mail
feed, I see this for the failed parsemail invocations where we've
returned a temp-fail:

  No handlers could be found for logger "patchwork.management.commands.parsemail"

If you recall, we had to alter the logging configuration for the ozlabs
instance:

  --- a/patchwork/settings/production.py
  +++ b/patchwork/settings/production.py
  @@ -70,7 +70,7 @@
   STATIC_URL = '/static/'
   
   
  -LOGGING = {
  +_LOGGING = {
       'version': 1,
       'disable_existing_loggers': False,
       'formatters': {

[this was your suggested fix an issue with parsemail failing with the
shipped LOGGING configuration, but I don't have the specifics of that..]

So, it appears that this workaround needs to be reworked?

Regards,


Jeremy
