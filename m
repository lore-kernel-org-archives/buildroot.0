From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  5 Feb 2010 10:15:04 +0000 (UTC)
Subject: [Buildroot] [Bug 1039] Not compiled on ubuntu karmic
In-Reply-To: <bug-1039-163@https.bugs.busybox.net/>
References: <bug-1039-163@https.bugs.busybox.net/>
Message-ID: <20100205101504.AC141776E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1039





--- Comment #4 from Eduard Bondarenko <edbond@gmail.com>  2010-02-05 10:15:03 UTC ---
I unchecked 'at', got another icu error:

g++ -g -O2  -fvisibility=hidden   -shared -Wl,-soname -Wl,libicule.so.38 -o
../lib/libicule.so.38.1 LEFontInstance.o OpenTypeLayoutEngine.o
ThaiLayoutEngine.o ThaiShaping.o ThaiStateTables.o ArabicLayoutEngine.o
GXLayoutEngine.o HanLayoutEngine.o IndicLayoutEngine.o LayoutEngine.o
ContextualGlyphSubstProc.o IndicRearrangementProcessor.o LigatureSubstProc.o
LookupTables.o MorphTables.o NonContextualGlyphSubstProc.o
SegmentArrayProcessor.o SegmentSingleProcessor.o SimpleArrayProcessor.o
SingleTableProcessor.o StateTableProcessor.o SubtableProcessor.o
TrimmedArrayProcessor.o AlternateSubstSubtables.o AnchorTables.o
ArabicShaping.o CanonData.o CanonShaping.o ClassDefinitionTables.o
ContextualSubstSubtables.o CoverageTables.o CursiveAttachmentSubtables.o
DeviceTables.o ExtensionSubtables.o Features.o GDEFMarkFilter.o
GlyphDefinitionTables.o GlyphIterator.o GlyphLookupTables.o
GlyphPosnLookupProc.o GlyphPositionAdjustments.o GlyphPositioningTables.o
GlyphSubstLookupProc.o GlyphSubstitutionTables.o IndicClassTables.o
IndicReordering.o LEInsertionList.o LEGlyphStorage.o LigatureSubstSubtables.o
LookupProcessor.o Lookups.o MarkArrays.o MarkToBasePosnSubtables.o
MarkToLigaturePosnSubtables.o MarkToMarkPosnSubtables.o MirroredCharData.o
MPreFixups.o MultipleSubstSubtables.o OpenTypeUtilities.o
PairPositioningSubtables.o ScriptAndLanguage.o ScriptAndLanguageTags.o
ShapingTypeData.o SinglePositioningSubtables.o SingleSubstitutionSubtables.o
SubstitutionLookups.o ValueRecords.o KhmerLayoutEngine.o KhmerReordering.o
TibetanLayoutEngine.o TibetanReordering.o HangulLayoutEngine.o KernTable.o
loengine.o -L../lib -licuuc -L../lib -L../stubdata -licudata -lpthread -lm 
rm -f ../lib/libicule.so.38 && ln -s libicule.so.38.1 ../lib/libicule.so.38
rm -f ../lib/libicule.so && ln -s libicule.so.38.1 ../lib/libicule.so
make[2]: Leaving directory
`/home/eduard/buildroot/output/build/icu-host/source/layout'
/usr/bin/make[1]: Making `all' in `layoutex'
make[2]: Entering directory
`/home/eduard/buildroot/output/build/icu-host/source/layoutex'
generating dependency information for playout.cpp
generating dependency information for LXUtilities.cpp
generating dependency information for plruns.cpp
generating dependency information for RunArrays.cpp
generating dependency information for ParagraphLayout.cpp
ParagraphLayout.cpp:816:6: error: #elif with no expression
make[2]: Leaving directory
`/home/eduard/buildroot/output/build/icu-host/source/layoutex'
make[2]: Entering directory
`/home/eduard/buildroot/output/build/icu-host/source/layoutex'
generating dependency information for ParagraphLayout.cpp
ParagraphLayout.cpp:816:6: error: #elif with no expression
g++ -D_REENTRANT -I. -I./unicode -I./.. -I../common  
-DU_LAYOUTEX_IMPLEMENTATION -g -O2  -fvisibility=hidden -c -DPIC -fPIC -o
ParagraphLayout.o ParagraphLayout.cpp
g++ -D_REENTRANT -I. -I./unicode -I./.. -I../common  
-DU_LAYOUTEX_IMPLEMENTATION -g -O2  -fvisibility=hidden -c -DPIC -fPIC -o
RunArrays.o RunArrays.cpp
g++ -D_REENTRANT -I. -I./unicode -I./.. -I../common  
-DU_LAYOUTEX_IMPLEMENTATION -g -O2  -fvisibility=hidden -c -DPIC -fPIC -o
LXUtilities.o LXUtilities.cpp
g++ -D_REENTRANT -I. -I./unicode -I./.. -I../common  
-DU_LAYOUTEX_IMPLEMENTATION -g -O2  -fvisibility=hidden -c -DPIC -fPIC -o
playout.o playout.cpp
ParagraphLayout.cpp:816:6: error: #elif with no expression
g++ -D_REENTRANT -I. -I./unicode -I./.. -I../common  
-DU_LAYOUTEX_IMPLEMENTATION -g -O2  -fvisibility=hidden -c -DPIC -fPIC -o
plruns.o plruns.cpp
make[2]: *** [ParagraphLayout.o] Error 1
make[2]: Leaving directory
`/home/eduard/buildroot/output/build/icu-host/source/layoutex'


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
