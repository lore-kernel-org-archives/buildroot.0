From: Ignacy =?utf-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
Date: Wed, 14 Oct 2020 14:39:43 +0200
Subject: [Buildroot] [PATCH 0/1] jquery: bump to version 3.5.1
In-Reply-To: <20201014133713.07b6eea7@windsurf>
References: <20201014110819.udxf25qnvs56nmmo@zenon.in.qult.net>
 <20201014133713.07b6eea7@windsurf>
Message-ID: <20201014123943.6rbwy64up6drs2g4@zenon.in.qult.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 14, 2020 at 01:37:13PM +0200, thus spake Thomas Petazzoni:
> On Wed, 14 Oct 2020 13:08:19 +0200
> Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr> wrote:
> 
> > It seems at least some packaged jQuery plugins are not necessarily
> > adapted to support jQuery version 3+.  It seems jquery-datetimepicker
> > may not be compatible, while jquery-sidebar declares no dependency on
> > any jquery version, but has not been updated for the past five years.
> 
> So perhaps we should drop those jquery plugins from Buildroot before
> updating, no? Or you're just not sure that they are not compatible ?

If I were to choose between dropping those packages vs. being stuck
with the old jQuery, I would definitely prefer the former.  Most of
the plugins seem to support jQuery 3.5.1 and for those that don't out
of the box, anyone interested can later dig them out, adapt them and
repackage them.

Another package that depends on the old jQuery and that hasn't been
bumped for a long time is flot (0.8.3 dates back to 2014).  It looks
like the project has since been taken over and migrated to Github,
were it is currently released as version 4.2.1.  I can attempt a
repackaging myself and submit a patch here.

-- 
Ignacy Gaw?dzki
R&D Engineer
Green Communications
