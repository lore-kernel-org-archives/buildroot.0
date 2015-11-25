From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 25 Nov 2015 16:22:56 +0000 (UTC)
Subject: [Buildroot] [Bug 8476] New: [lttng] Version 2.6.0 unusable with
	kernel v4.0.0
Message-ID: <bug-8476-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8476

           Summary: [lttng] Version 2.6.0 unusable with kernel v4.0.0
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: All
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: baronju at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Generating a build using buildroot with linux kernel v4.0.0 and lttng packages
generates the following error :

  CC [M] 
/continuus/jb01445/hg/br-top/buildroot/output/build/lttng-modules-2.6.0/probes/lttng-probe-block.o
In file included from
/continuus/jb01445/hg/br-top/buildroot/output/build/lttng-modules-2.6.0/probes/../instrumentation/events/lttng-module/../../../probes/define_trace.h:136:0,
                 from
/continuus/jb01445/hg/br-top/buildroot/output/build/lttng-modules-2.6.0/probes/../instrumentation/events/lttng-module/kmem.h:380,
                 from
/continuus/jb01445/hg/br-top/buildroot/output/build/lttng-modules-2.6.0/probes/lttng-probe-kmem.c:42:
/continuus/jb01445/hg/br-top/buildroot/output/build/lttng-modules-2.6.0/probes/../instrumentation/events/lttng-module/../../../probes/lttng-events.h:180:6:
error: conflicting types for ?trace_mm_page_alloc_extfrag?
 void trace_##_name(_proto);
      ^
/continuus/jb01445/hg/br-top/buildroot/output/build/lttng-modules-2.6.0/probes/../instrumentation/events/lttng-module/../../../probes/lttng-events.h:47:2:
note: in expansion of macro ?LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP?
  LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(map, name, map, PARAMS(proto),
PARAMS(args))
  ^
/continuus/jb01445/hg/br-top/buildroot/output/build/lttng-modules-2.6.0/probes/../instrumentation/events/lttng-module/../../../probes/lttng-events.h:107:2:
note: in expansion of macro ?LTTNG_TRACEPOINT_EVENT_MAP?
  LTTNG_TRACEPOINT_EVENT_MAP(name, name,    \
  ^
/continuus/jb01445/hg/br-top/buildroot/output/build/lttng-modules-2.6.0/probes/../instrumentation/events/lttng-module/../../../probes/../instrumentation/events/lttng-module/kmem.h:291:1:
note: in expansion of macro ?LTTNG_TRACEPOINT_EVENT?
 LTTNG_TRACEPOINT_EVENT(mm_page_alloc_extfrag,
 ^
In file included from include/trace/events/kmem.h:8:0,
                 from
/continuus/jb01445/hg/br-top/buildroot/output/build/lttng-modules-2.6.0/probes/lttng-probe-kmem.c:31:
include/linux/tracepoint.h:169:21: note: previous definition of
?trace_mm_page_alloc_extfrag? was here
  static inline void trace_##name(proto)    \
                     ^
include/linux/tracepoint.h:325:3: note: in expansion of macro ?__DECLARE_TRACE?
   __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args), 1, \
   ^
include/linux/tracepoint.h:459:2: note: in expansion of macro ?DECLARE_TRACE?
  DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
  ^
include/trace/events/kmem.h:267:1: note: in expansion of macro ?TRACE_EVENT?
 TRACE_EVENT(mm_page_alloc_extfrag,
 ^
make[4]: ***
[/continuus/jb01445/hg/br-top/buildroot/output/build/lttng-modules-2.6.0/probes/lttng-probe-kmem.o]
Error 1

It seems that lttng v2.6.0 does not work with "recent" kernel version. Using
lttng-modules 2.6.4, lttng-ust 2.6.4 and lttng-tools 2.6.1 seems to solve the
problem.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
